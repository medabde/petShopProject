package ma.noobs.pet.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;

public interface Dao<T> {
    
    Optional<T> get(long id);
    
    List<T> getAll();
    
    void save(T t);
    
    void update(T t, HashMap<String,String> params);
    
    void delete(T t);
}