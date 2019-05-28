classdef MyList
    % List Data structure
    
    properties
        list
        len
    end
    
    methods
        function obj = MyList()
            obj.list = [];
            obj.len = 0;
        end
        function obj = add(obj, value)
            if obj.len == 0
                obj.list = [value];
                obj.len = 1;
            else
                obj.len = obj.len + 1;
                obj.list(obj.len) = value;
            end
        end
        function obj = cut(obj, index)
            obj.len = index;
            obj.list = obj.list(1:index);
        end
        function value = get(obj, index)
            if index > obj.len || index < 1
                value = 0;
            else
                value = obj.list(index);
            end
        end
        function value = leng(obj)
            value = obj.len;
        end
    end
    
end

