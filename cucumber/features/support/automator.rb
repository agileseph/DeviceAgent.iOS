module DeviceAgent
  module Automator

    require "run_loop"

    @@client = nil

    def self.client
      @@client
    end

    def self.client=(client)
      @@client = client
    end

    def self.shutdown
      Automator.client.send(:shutdown)
    end

    def query(uiquery)
      Automator.client.query(uiquery)
    end

    def query_for_coordinate(uiquery)
      Automator.client.query_for_coordinate(uiquery)
    end

    def tree
      Automator.client.tree
    end

    def rotate_home_button_to(symbol_or_string)
      position = symbol_or_string.to_sym
      Automator.client.rotate_home_button_to(position)["orientation"]
    end

    def orientations
      Automator.client.orientations
    end

    def touch(uiquery, options={})
      Automator.client.touch(uiquery, options)
    end

    def touch_coordinate(coordinate, options={})
      Automator.client.touch_coordinate(coordinate, options)
    end

    def touch_point(x, y, options={})
      Automator.client.touch_point(x, y, options)
    end

    def double_tap(uiquery, options={})
      Automator.client.double_tap(uiquery, options)
    end

    def two_finger_tap(uiquery, options={})
      Automator.client.two_finger_tap(uiquery, options)
    end

    def long_press(uiquery, options={})
      Automator.client.long_press(uiquery, options)
    end

    def keyboard_visible?
      Automator.client.keyboard_visible?
    end

    def clear_text
      Automator.client.clear_text
    end

    def enter_text(string)
      Automator.client.enter_text(string)
    end

    def enter_text_in(uiquery, text)
      touch(uiquery)
      wait_for_keyboard
      enter_text(text)
    end

    def delete_with_backspace_char
      Automator.client.enter_text("\b")
    end

    def touch_keyboard_delete_key
      touch({marked: "delete"})
    end

    def change_volume(direction)
      Automator.client.change_volume(direction)
    end

    def server_version
      Automator.client.server_version
    end

    def session_identifier
      Automator.client.send(:session_identifier)
    end

    def session_delete
      Automator.client.send(:session_delete)
    end

    def device_info
      Automator.client.device_info
    end

    def process_pid(bundle_identifier)
      Automator.client.send(:process_pid, bundle_identifier)
    end

    def terminate(bundle_identifier)
      Automator.client.send(:terminate_app, bundle_identifier)
    end

    def app_running?(bundle_identifier)
      Automator.client.send(:app_running?, bundle_identifier)
    end

    def send_app_to_background(bundle_identifier)
      Automator.client.send(:send_app_to_background, bundle_identifier)
    end

    def app_state(bundle_identifier)
      Automator.client.send(:app_state, bundle_identifier)
    end

    def running?
      Automator.client.running?
    end

    def alert_visible?
      Automator.client.alert_visible?
    end

    def pan_between_coordinates(from_point, to_point, options={})
      default_options = {
        :duration => 1.0,
        :num_fingers => 1,
        :allow_inertia => true,
        :first_touch_hold_duration => 0.0
      }
      merged_options = default_options.merge(options)
      Automator.client.pan_between_coordinates(from_point, to_point, merged_options)
    end

    def element_center(hash)
      rect = hash["rect"]
      h = rect["height"]
      w = rect["width"]
      x = rect["x"]
      y = rect["y"]

      touchx = x + ((w/2.0).round(2))
      touchy = y + ((h/2.0).round(2))

      new_rect = rect.dup
      new_rect[:center_x] = touchx
      new_rect[:center_y] = touchy

      RunLoop.log_debug(%Q[Rect from query:

#{JSON.pretty_generate(new_rect)}

])
      {:x => touchx, :y => touchy}
    end

    def wait_for_animations
      Automator.client.wait_for_animations
    end

    def wait_for(timeout_message, options={}, &block)
      Automator.client.wait_for(timeout_message, options, &block)
    end

    def wait_for_keyboard
      Automator.client.wait_for_keyboard
    end

    def wait_for_no_keyboard
      Automator.client.wait_for_no_keyboard
    end

    def wait_for_alert
      Automator.client.wait_for_alert
    end

    def wait_for_no_alert
      if RunLoop::Environment.ci?
        delay = 2.0
      else
        delay = 1.0
      end
      sleep(delay)
      Automator.client.wait_for_no_alert
    end

    def set_dismiss_springboard_alerts_automatically(true_or_false)
      Automator.client.set_dismiss_springboard_alerts_automatically(true_or_false)
    end

    def springboard_alert
      Automator.client.springboard_alert
    end

    def springboard_alert_visible?
      Automator.client.springboard_alert_visible?
    end

    def wait_for_springboard_alert
      Automator.client.wait_for_springboard_alert
    end

    def wait_for_no_springboard_alert
      if RunLoop::Environment.ci?
        delay = 2.0
      else
        delay = 1.0
      end
      sleep(delay)
      Automator.client.wait_for_no_springboard_alert
    end

    def dismiss_springboard_alert(button_title)
      Automator.client.dismiss_springboard_alert(button_title)
    end

    def wait_for_text_in_view(text, uiquery, options={})
      Automator.client.wait_for_text_in_view(text, uiquery, options)
    end

    def wait_for_view(uiquery, options={})
      Automator.client.wait_for_view(uiquery, options)
    end

    def wait_for_no_view(uiquery, options={})
      Automator.client.wait_for_no_view(uiquery, options)
    end

    def fail(*several_variants)
      Automator.client.fail(*several_variants)
    end

    def element_types
      Automator.client.element_types
    end

    def screenshot(filepath = "")
      Automator.client.screenshot(filepath)
    end
  end
end

World(DeviceAgent::Automator)
